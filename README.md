# ShieldSquare

Rails connector to access shield square bot detection API

## Pre-Requisites
Ruby version >=2.0 and Rails >= 4.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ss2', :git => "https://github.com/ShieldSquare/SS_Connector_RoR/tree/ShieldSquare_RoR_v2.1"
```
Run the bundle command to install the gem.

After you install the gem, run the generator:

``` 
rails generate ss2:install
```

The generator will install an initializer ss2_config.rb with default configuration to access shield square API.  Update the configuration file with your subscriber id, server etc.

Update your view file with the code to access shield shquare API and JS snippet

#Example of View

Your View should contain following : (add to layout file to make it available across all pages)

```ruby
 shieldsquare_userid = "your-user-id" # Enter the UserID of the user
  shieldsquare_calltype = 1
  shieldsquare_pid = ""
  @shieldsquare_response = Ss2.shieldsquare_ValidateRequest(shieldsquare_userid, shieldsquare_calltype, shieldsquare_pid, request, cookies)
  if @shieldsquare_response["responsecode"]==-1
    puts "Curl Error - " + @shieldsquare_response["reason"] + "<BR>"
    puts "Please reach out to ShieldSquare support team for assistance <BR>"
    puts   "Allow the user request"
  end
```
And add the following code to the footer part of layout.
[NOTE : @shieldsquare_response["pid"] is value from the above API Call]

```javascript
<script>
  var __uzdbm_a = '<%= @shieldsquare_response["pid"] %>' ;
  var __uzdbm_b = '<%= @shieldsquare_response["url"] %>';
  <%= @shieldsquare_response["dynamic_JS"] %>;
  (function() {
      var send = XMLHttpRequest.prototype.send,
          token = $('meta[name=csrf-token]').attr('content');
      XMLHttpRequest.prototype.send = function(data) {
          this.setRequestHeader('X-CSRF-Token', token);
          return send.apply(this, arguments);
      };
  }());
</script>
```

