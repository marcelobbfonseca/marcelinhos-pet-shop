pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the pet that will be used for testing
    uint expectedPetId = 8;

    //The expected owner of adopted pet is this contract
    address expectedAdopter = this;


    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);
        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    function testGetAdopterById() public {
        address adopter = adoption.adopters(expectedPetId);
        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");

    }

    function testGetAdopterAddressByPetId() public {
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}