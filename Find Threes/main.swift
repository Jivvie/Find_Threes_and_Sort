//
//  main.swift
//  Find Threes
//
//  Created by Gjvon Graves on 8/11/16.
//  Copyright (c) 2016 Mitnov. All rights reserved.
//

import Foundation


var arrayA: Array<Int> = [5, 4, 9, 3, 3, 3, 6, 6, 7, 1, 1, 1, 3, 5];
///Array with no initial values.
var arrayB: Array<Int> = [];

/// /// This method receives an Int array and finds 3 consecutive integers.
/// Edits the uninitialized array with consecutive values.
/// Note: Array will not become an array with all three consecutive integers.
/// Example: array[3, 3, 3] The appended array will have one value; array[3]**
func findThrees(arrayA: Array<Int>) {
    /// Variable will find the
    var foundNumOfValues = 0;
    /// Variable will hold the index of final value within the array.
    var lastElement = arrayA.count - 1;
    for i in 1 ... lastElement {
        //If the current array element is equal to the previous array element, increment
        //a variable to keep count of consecutive values.
        if (arrayA[i] == arrayA[i - 1]) {
            foundNumOfValues++
        }
        //If the number of consecutive values (@variable: foundNumOfValues) is equal to 2,
        //run this if block. If the current index is already a value of the previous and the
        //variable has already been incremented, there are three consecutive values. This is
        //why we increment to 2 and not 3. Example [1,3,3,3]
        // At index 1 nothing happens. At index 2, the variable increments. At index 3,
        // the variable increments once more. That is a consecutive three.
        //We now see why it only takes the variable to equal 2, not three.
        if (foundNumOfValues == 2) {
            print("Found 3")
            //Add the current index value to our allocated array with no values.
            //This array will hold all groups of a consecutive value/s.
            //Keep in mind that not all three values will be appended. One value will
            //represent them all. Example: arrayA[3,3,3] -> arrayB[3]
            arrayB.append(arrayA[i])
            //A group was found. To find another, we should set the foundNumOfValues variable
            //to zero. 
            foundNumOfValues = 0;
        }
    }
}
/// /* /// This function is a basic insertion sort implementation.*/
func orderedThrees(var arrayB: Array<Int>) -> Array<Int> {
    for (var n: Int = 1; n < arrayB.count; n++) {
        for (var j: Int = n; j > 0; j--) {
            //if the higher index holds a value less than the lower index,
            //run if statement and swap the values.
            if (arrayB[j] < arrayB[j - 1]) {
                //Temp will hold a temporary value to complete the swap.
                var temp: Int = arrayB[j];
                arrayB[j] = arrayB[j - 1];
                arrayB[j - 1] = temp;
            }
        }
    }
    //This is the array we will return as mentioned above in comments. This array
    //will hold only the values found consecutively, not every consecutive value.
    //Three 3s as in [3,3,3] will only generate a single 3 in the returned array.
    return arrayB;
}
//Call function to get the groups of threes.
findThrees(arrayA)
//Overwrite the allocated array as the new sorted array.
arrayB = orderedThrees(arrayB)
print(arrayB)
