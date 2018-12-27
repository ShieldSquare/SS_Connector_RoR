# ShieldSquare

Rails connector to access shield square bot detection API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ss2', :git => 'https://github.com/ShieldSquare/SS_Connector_RoR', :branch => 'ror_multisite'
```
Run the bundle command to install the gem.

After you install the gem, run the generator:

```
rails generate ss2:install
```

The generator prompts for the following details to create ss2_config.rb:

1. Server name - It lists down the available Shield Square servers. Please choose the server closest to your region by selecting the option.

2. Sid - Enter the Subscriber Id available in your shield square account - https://admin.shieldsquare.com/subscriber_details/. Copy the Sandbox Id if it is Monitor mode or the Production Id for Active mode

Once the above options are entered ss2_config.rb will be created inside config/initializers folder.

Update your view file with the code to access shield square API and JS snippet

Build Info
Date: 27/Dec/2018
Version: 3.0.0
Major Feature: Added Non-fti multi-site support.
