WoodChopper
=============

Selective logging based on command line arguments and keys.
 
Written in CoffeeScript, usable in JavaScript.

Usable with all the `console` methods,
as seen in [this list](https://developer.mozilla.org/en/docs/Web/API/console) from Mozilla.

## Installation

    $ npm install woodchopper
    
## Use

Run your node program in the command line with the `--print` or `-p` flag and the keys you want to print:

    $ node program.js --print important secure
    
Then in your code give your print statements their keys:

    var chop = require('woodchopper');
    
    chop.log(['important', 'superfluous'], 'This is the first print message');
    chop.log(['superfluous', 'detail'], 'This is the second print message');
    chop.log(['detail', 'secure'], 'This is the third print message');
    
This would result in the following messages being printed:

    'This is the first print message'
    'This is the third print message'

Running the program like this:

    $ node program.js --print detail

Will result in:

    'This is the second print message'
    'This is the third print message'

If you give a print statement only one key you do not need to put it in an array:

    chop.log('superfluous', 'This is the fourth print message');

