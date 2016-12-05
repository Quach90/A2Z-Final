
// Using express: http://expressjs.com/
var express = require('express');
// Create the app
var app = express();

// Set up the server
// process.env.PORT is related to deploying on heroku
var server = app.listen(process.env.PORT || 3000, listen);

// This call back just tells us that the server has started
function listen() {
  var host = server.address().address;
  var port = server.address().port;
  console.log('Example app listening at http://' + host + ':' + port);
}

// This is for hosting files
// Anything in the public directory will be served
// This is just like python -m SimpleHTTPServer
// We could also add routes, but aren't doing so here
// app.use(express.static('public'));

// Create an Twitter object to connect to Twitter API
// npm install twit
var Twit = require('twit');

// Pulling all my twitter account info from another file
var config = require('./config.js');
// Making a Twit object for connection to the API
var T = new Twit(config);

// This route searches twitter
app.get('/timeline/:screen_name', getTweets);

// Callback
function getTweets(req, res) {
  console.log("ondi");
  // Here's the string we are seraching for
  var screen_name = req.params.screen_name;
  console.log(screen_name);
  getTweet(screen_name);


   function getTweet(user, max_id) {
          if (max_id) {
              T.get('statuses/user_timeline', {
                  screen_name: user,
                  count: 200,
                  include_rts: false,
                  exclude_replies: false,
                  max_id: max_id
              }, tweeted);
          } else {
              T.get('statuses/user_timeline', {
                  screen_name: user,
                  count: 200,
                  include_rts: false,
                  exclude_replies: false
              }, tweeted);
          }
      }

  var tweets = "";

  function tweeted(err, reply) {
      // If there was an error let's respond with that error
      if (err) {
        res.send(err);
      // Otherwise let's respond back that it worked ok!
      } else {
        
        console.log(reply);
        reply.forEach(function(e, i) {
                // console.log("Tweet " + i);
                // console.log("Text " + e.text);
                // generator.feed(e.text);
                // tweetCounter++;
                tweets += e.text + " ";
        
        })
        res.send(tweets);
  }
}
};
