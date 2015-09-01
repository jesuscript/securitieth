contract corpAct{
    function execute(address sender, uint amount, uint extraData){}
}

contract security{
    //only called by corporate action contracts
    function admin(uint corpAct, address account, int amount, uint state){
}
    address issuer;
    uint currentState;
    mapping(uint => corpAct) cAContracts;
    mapping(address =>mapping(uint=>uint)) public balances;
}
//Voting contract tallies votes of share holders
contract proxyVote is corpAct{
    function proxyVote(address parent, uint ca){
        parentSecurity = parent;
        corpAct = ca;
    }
    address public parentSecurity;
    uint public corpAct;
    mapping(uint=>uint) votes;
    //this records the votes and moves the shares to a new state.
    function execute(address sender, uint amount, uint extraData){
        if (msg.sender != parentSecurity) return;
        votes[extraData] += amount;
        security(msg.sender).admin(corpAct,sender,-int(amount),corpAct);
        security(msg.sender).admin(corpAct,sender,int(amount),corpAct+1);
    }
    
}