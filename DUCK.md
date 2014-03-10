## Need to;

- [ ] finish specs
- [ ] go over specs
- [ ] go over src

## Backend

Can utilize SSE for live sync.

Login/Authorization done using OAuth.io + Ominauth. If we login with username/password we just popoup the form login 
and then in the callback page we send out the logged in event.

In the Oauth.io callback will simply post to our backend using the omniauth plugin.

We can save to REST API. 

How do we persist to local storage and REST?

1. A flag to indicate if the model has been persisted to the server

Then we can simply make sure we go over the models that haven't been persisted yet and persist them

We will utilize http://github.hubspot.com/offline/ to check when we are offline/online

Then when we are up we up we;

1. Call ajaxSave on everything that hasn't been persisted 


Or maybe we just autmatically trigger ajax saves? and just queue them if it's not up?

Then when it just goes up we only need to call the queue?

The problem with that method is potentially we queue up a shit ton on an app that hasn't been connected for awhile.

The other bit can be non-blocking and you could limit it to 25 entries and also always make it sync.

Yeah definitely just call ajaxSave on things.

That StatBar is getting out of hand. What we want is the icons for the past tasks should be relatively
close. I was thinking that when we expand the element we need to increase the icons height.
But that is wrong (I think). We can just get away with adding icons to the stat bar when we open
something.

Actually for now forget that just, make it work with one open section don't allow to see tasks from a previous 
day. Just a circle and a count.

We have way over complicated the days handling code. There will alays be the days because the tasks are created via the day 
model. DUH! This means days are straightforqward and only really need a year field added. We can just make sure we 
save the day ID to the Task and then loop through the days and add an item that way.

View wise I think we should have a stat bar for each day and keep the day in a list. If we need height adjustment on 
the stat bar we can simply do it via open/close events to adjust the height.

No syncing for now. Which means no sign in for now. Payment handling can wait until it is a webapp

Remember the tasks should just have a body and we extract the title from it.

All we have to do for tests is require from the lib directory. Then node-browersify the specs as one file.

Once we have all the specs passing it's just a matter of styling! Right?! (Probably not)
