#!/usr/local/bin/python3
from __future__ import print_function
import httplib2
import os
import sys

from apiclient import discovery
from oauth2client import client
from oauth2client import tools
from oauth2client.file import Storage

import datetime
from dateutil.parser import parse
import json

try:
    import argparse
    parser = argparse.ArgumentParser(parents=[tools.argparser])
    parser.add_argument('-c', '--calendar', action='store_true')
    parser.add_argument('-e', '--events', action='store_true')
    flags = parser.parse_args()
except ImportError:
    flags = None

# If modifying these scopes, delete your previously saved credentials
# at ~/.credentials/calendar-python-quickstart.json
SCOPES = 'https://www.googleapis.com/auth/calendar.readonly'
CLIENT_SECRET_FILE = 'client_secret.json'
APPLICATION_NAME = 'Google Calendar API Python Quickstart'

def usage():
    print('''
    gcal.py
    Interacts with the Google Calendar API
    -c --calendar fetches list of calendars and asks to set active/inactive
    ''')

def get_credentials():
    """Gets valid user credentials from storage.

    If nothing has been stored, or if the stored credentials are invalid,
    the OAuth2 flow is completed to obtain the new credentials.

    Returns:
        Credentials, the obtained credential.
    """
    home_dir = os.path.expanduser('~') # /Users/kevzheng
    credential_dir = os.path.join(home_dir, '.credentials') # /Users/kevzheng/.credentials
    if not os.path.exists(credential_dir):
        os.makedirs(credential_dir)
    
    # /Users/kevzheng/.credentials/calendar-python-quickstart.json
    credential_path = os.path.join(credential_dir,
                                   'calendar-python-quickstart.json')

    store = Storage(credential_path)
    credentials = store.get()
    if not credentials or credentials.invalid:
        flow = client.flow_from_clientsecrets(CLIENT_SECRET_FILE, SCOPES)
        flow.user_agent = APPLICATION_NAME
        if flags:
            credentials = tools.run_flow(flow, store, flags)
        else: # Needed only for compatibility with Python 2.6
            credentials = tools.run(flow, store)
        print('Storing credentials to ' + credential_path)
    return credentials


def refresh_calendars(service, filename):
    """Fetches user's calendars and asks user to activate them

    Calendars are only considered in other functions if active
    """
    print('Refreshing calendars...')

    data = {'calendars':{}}
    active = {}
    inactive = {}

    calendar_list = service.calendarList().list().execute()
    # Loop through calendars
    for item in calendar_list['items']:
        active_flag = input("  Activate {} ? [y/N] ".format(item['summary']))
        if(str.lower(active_flag) == 'y'):
            active[item['summary']] = item['id']
        else:
            inactive[item['summary']] = item['id']
            
    data['calendars']['active'] = active
    data['calendars']['inactive'] = inactive

    with open(filename, 'w') as jsonfile:
        json.dump(data, jsonfile, indent=4)

def refresh_events(service, delta, calendar_file, out_file):
    print('Refreshing events...\n')

    now = datetime.datetime.utcnow().isoformat() + 'Z' # 'Z' indicates UTC time
    maxTime = (datetime.datetime.utcnow() + datetime.timedelta(hours=delta)).isoformat() + 'Z'

    data = {'events':[]}
    calendar = json.load(open(calendar_file, 'r'))

    for cal, cal_id in calendar['calendars']['active'].items():   
        print('{}'.format(cal))
        eventsResult = service.events().list(
            calendarId=cal_id, timeMin=now, timeMax=maxTime, singleEvents=True,
            orderBy='startTime').execute()
        events = eventsResult.get('items', [])
        if not events:
            print('No upcoming events found.')
        for event in events:
            if event['summary'] != 'Work':
                start = parse(event['start'].get('dateTime', event['start'].get('date')))
                start_string = start.strftime("%I:%M %p").lstrip('0')
                data['events'].append({'time':start_string, 'title':event['summary']})

            print(start_string)

            print(start.time(), start.date(), event['summary'])

            #data['events'].append() = [str(start.time()), str(start.date())]

            #data['events'][event['summary']] = start.now()
            #print(start, event['summary'])
        print('')
    with open('events.json', 'w') as jsonfile:
        json.dump(data, jsonfile, indent=4)

def main():
    """
    Creates a Google Calendar API service object
    Can interact with list of calendars, events
    """

    # Creates service object
    credentials = get_credentials()
    http = credentials.authorize(httplib2.Http())
    service = discovery.build('calendar', 'v3', http=http)

    # Gets all calendars
    if(flags.calendar):
        refresh_calendars(service, 'gcal.json')

    # Gets all calendars
    if(flags.events):
        refresh_events(service, 48, 'gcal.json', 'events.json')

if __name__ == '__main__':
    main()
