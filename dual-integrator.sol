contract DualIntegrator {
  uint months;
  address partyAAddress;
  address partyBAddress;
  string contractHash;
  string partyAName;
  string partyBName;

  function DualIntegrator(uint _months, address _partyAAddress, address _partyBAddress, string _partyAName, string _partyBName) {
    partyAAddress = _partyAAddress;
    partyBAddress = _partyBAddress;
    partyAName = _partyAName;
    partyBName = _partyBName;
    months = _months;
  }

  function setHash(string _hash) {
    contractHash = _hash; // we do not include permission checking here, but in a real application you would restrict this
  }

  function getParams() constant returns (uint _months, address _partyAAddress, address _partyBAddress) {
    return (months, partyAAddress, partyBAddress);
  }

  function getNames() constant returns (string _hash) {
    //, string _partyAName, string _partyBName) {
    return (contractHash); //, partyAName, partyBName);
  }
}

contract IntegratorFactory {
  address[] addresses;

  function createInstrument(uint _months, address _partyAAddress, address _partyBAddress, string _partyAName, string _partyBName) returns (address IntegratorAddr) {
    address mostRecentIntegrationContract;
    mostRecentIntegrationContract = new DualIntegrator(_months, _partyAAddress, _partyBAddress, _partyAName, _partyBName);
    // NOTE: we do not set the hash in the contract on instantiation because the address of the code
    //   needs to be added to the prose document before it is signed with Docusign API and finalized
    //   with the hash of the document.

    // return the contract address for consumption
    addAddress(mostRecentIntegrationContract);
    return mostRecentIntegrationContract;
  }

  function addAddress(address newAddress) {
    addresses.push(newAddress);
  }

  function getAddresses() constant returns (address[] _addresses) {
    return addresses;
  }
}
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help