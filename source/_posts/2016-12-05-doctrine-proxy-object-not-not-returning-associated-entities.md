---
title:      Doctrine proxy object not not returning associated entities
author:     Toby Griffiths
categories:
- web development
tags:
- PHP
- Doctrine
abstract:   >
  I recently had a problem with Doctrine not returning related entities when attempting to access them on a proxy 
  object. Here's how I fixed it.
image:
    file:           ~
    description:    ~
    credit:
        name:   ~
        url:    ~
---
### The problem

I was recently working on a project that had code to loop over collection of related Doctrine entities, and total up the 
values on each. The problem was that the object who's collection property I was trying to get the related entities for 
was a Proxy object, and the getter for this property was returning `null` rather than a persistent collection object.  
I spent a good few hours trying to debug this, stepping through the process to see why it wasn't returning a value.

### The diagnosis

Eventually I stepped through pretty much the whole process of reading the original entity & through to the accessing of 
the collection, and worked out that, when it was attempting to access the property, it was attempting to load the proxy 
collection data, but the proxy object had a different object ID to the one that the entity manager knew about, so it was 
creating a brand new one, without the associated data.
   
So why was this happening?  It turns out that, due to the fact that I was attempting to save a record with `null` values 
to a database table field that wasn't nullable.  This was causing an exception to be thrown, & logged, however in my 
code I was catching this exception and displaying an error message about the record not being saved.  The real cause of 
the problem was that when Doctrine fails to save an entity, it clears the Unit of Work, and so removes all the known 
records, meaning that when you attempt to access the properties on the proxy object, the Unit of Work does not know 
about it, and so creates a new one, but in so doing, bypasses the loading of the data for it.

### The fix

The way to fix this it to ensure that you re-load your entities after Doctrine throws an exception like this.

I hope that this helps anyone coming across this with similar problems.  If so, please let me know in the comments.

Have an awesome day! :o)