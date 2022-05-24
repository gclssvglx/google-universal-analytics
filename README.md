# Google Universal Analytics

A tool to help locate and replace existing Google Universal Analytics (UA) data tracking attributes.

## Getting started

Make sure you have Ruby 2.7.5 installed, then

```bash
bundle install
```

## Usage

From the google-universal-analytics directory you will be able to run the 'find_tracking_attributes' script. The script takes a parameter, that being the name of the application you wish to scan for tracking elements. 

For example;

```bash
find_tracking_attributes collections
```

The script does make an assumption about the structure of your directories. It is expected that the script will be run from the following path, /Users/yourname/govuk/google-universal-analytics. The important element here being the /govuk directory, where it is also assumed the apps you are interested in scanning will be located. 

Once this script is run it will output a txt file and csv file into the govuk root directory. 

## Testing

```bash
ruby -Ilib:test test/google_universal_analytics/test_finder.rb
```
