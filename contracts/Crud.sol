// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Crud{
    struct person{
        uint age;

        string name;
        string email;
        address walletAddress;
    }
    uint public totalEmployee;
    person[] public  personDetails;
    // constructor(){
    //      totalEmployee=0;
    // }

    function createPerson(uint age, string memory name, string memory email,address walletAddress) public returns  (uint){
        person memory newPerson = person(age,name,email,walletAddress);
        personDetails.push(newPerson);
        totalEmployee++;
        return totalEmployee;
    }

function getAllPerson(uint index) public view returns(person memory)
{
   return personDetails[index];
}

function updatePerson(string memory name,string memory email) public returns(string memory)
{
for(uint i=0;i<totalEmployee;i++){
    if(compareString(personDetails[i].email,email)){

    personDetails[i].name=name;
    }
}
string memory message="updated successfully";
return message;
}


// function deleteRecord(string memory email) public returns(string memory){
//     if(compareString(personDetails.email,email)){
        
//     }
// }
function remove(uint index) public returns(string memory) {
    string memory deleteMessage;
        if (index >= totalEmployee) {
            deleteMessage="no data found";
            return deleteMessage;
        }

        for (uint i = index; i<personDetails.length-1; i++){
            personDetails[i] = personDetails[i+1];
        }
        delete personDetails[personDetails.length-1];
        totalEmployee--;
        deleteMessage="data deleted successfully";
        return deleteMessage;
    }


    function compareString(string memory a,string memory b) internal pure returns(bool)
    {
        return keccak256(abi.encodePacked(a))==keccak256(abi.encodePacked(b));
    }
}