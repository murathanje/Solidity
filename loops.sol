//SPDX-License-Identifier: Unlicensed


pragma solidity ^0.8.0;

contract loop {

    uint[15] public numbers0;
    uint[15] public numbers1;

    function listByFor() public {

        uint[15] memory nums = numbers0;
        
        for(uint i = 0; i < nums.length; i++) {

            // if(i==9) continue; break;
            nums[i] = i;
        }
        numbers0 = nums;
    }


    function listByWhile() public {
        uint i = 0;

        while(i < numbers1.length) {

            numbers1[i] = i;
            i++;

        }
    }


    function getArray0() public view returns(uint[15] memory) {
        return numbers0;
    }

    function getArray1() public view returns(uint[15] memory) {
        return numbers1;
    }


}