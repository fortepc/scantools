console.clear();
console.println("Starting")
console.println("There are " + this.numPages + " pages in this document");

// counters. Future expansion here to accomadate many more page size options. Not until the page counts summary can skip printing pages sizes with 0 counted to avoid too much console spam

var numArchE1 = 0;

var numArchD = 0;

var numArchC = 0;

var numLedger = 0;

var numLetter = 0;

var numOther =0;

var numArea = 0;

// helper function to compare a number with some wiggle room - we look for portrait and landscape possibilities.

function inRange(wid,hei,targetWid,targetHei) {

    var wiggle = 72; // amount of error to allow in Points if height or width is within this margin of error this script will count it. 144 = 2 inches.

    return (wid>=(targetWid-wiggle) && wid<=(targetWid+wiggle)) &&  (hei>=(targetHei-wiggle) && hei<=(targetHei+wiggle)) || (hei>=(targetWid-wiggle) && hei<=(targetWid+wiggle)) &&  (wid>=(targetHei-wiggle) && wid<=(targetHei+wiggle))

}

for (pagenum=0;pagenum<this.numPages;pagenum++) {

    var pbox = this.getPageBox("Crop",pagenum);

    var width = (pbox[2] - pbox[0]);

    var height = (pbox[1] - pbox[3]);
	
    var numArea = numArea + ( width/72 * height/72 ) //calculates the sq inches of the page and adds it to the total so far for the doc

// look for pages of a paticular size and adds to the counters for that page size. Define page sizes in points, 72 Points Per Inch.
	
    if (inRange(width,height,3024,2160)) { numArchE1++; recognized = true; continue;}

    if (inRange(width,height,2592,1728)) { numArchD++; recognized = true; continue;}

    if (inRange(width,height,1728,1296)) { numArchC++; recognized = true; continue;}

    if (inRange(width,height,792,1224)) { numLedger++; recognized = true; continue;}

    if (inRange(width,height,792,612)) { numLetter++; recognized = true; continue;}

    // This section lists any page sizes that ARE NOT within 2 inches of the defined page sizes, and counts them

    numOther++;

    console.println("Page " + (pagenum+1) + " is " + Math.round((width/72)) + " inches by " + Math.round((height/72)) + " inches");

}

//Print Summary, in the future I plan on making it only print the line if the count is not 0. 

console.println(numLetter + " Letter pages (8.5x11)");

console.println(numLedger + " Ledger pages (11x17)");

console.println(numArchC + " Arch C pages (24x18)");

console.println(numArchD + " Arch D pages (36x24)");

console.println(numArchE1 + " Arch E1 pages (42x30)");

console.println(numOther + " Other Page Sizes");

var numSqFt = numArea/144; //converts the square inches to sqft

console.println(this.numPages  + " pages totalling " + Math.ceil(numSqFt) + " square ft")
