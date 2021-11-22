## Combining operators
This set of operatos let us combine events emitted by diferent publishers and create meaningful combinations of data in our combine code.

- prepend - this will prepend values at the beginning of your publisher. in other words add values that emit before any values from your original publisher.
- append - this set of operators deals with concatenating events emmited by publisher with other values it will add items to the original publisher after this has finished a completion event.
- switchToLatest - ***IMPORTANT*** this is one of the most powerful operators in combine as it enables to switch entire publisher subscriptions on the fly while cancelling the pending publisher subscription a good read on this can be found here: https://jllnmercier.medium.com/combine-switchtolatest-52252aaf38c 
- merge - Combines elements from a current publisher with those from another publisher of the same type delivering an interleaved sequence of elements

A mention here... The next two have potential are powerful and a lot of ideas come to mind, however they must be handled with care and on top of that you must consider that you will be dealing with tuples which are limited. However seeing their use, you can further expand on this content by seeing how to do the same performance using combine with arrays. 
- combineLatest - Used when you want the downstream subscriber to receive a tuple of the most-recent elements from multiple publishers when *any* of them emit a value
- zip - You can consider it does the same as the last but with layers, a layer will be completed once both values are filled then an event will be trigered, every layer must have received both values in order to triger the event.

