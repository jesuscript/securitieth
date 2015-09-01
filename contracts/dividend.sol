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
//contract i sfunded with ether to pay the dividend
contract dividend is corpAct{
    function dividend(address parent, uint rate, uint ca){
        parentSecurity = parent;
        dividendRate = rate;
        corpAct = ca;
    }
    address public parentSecurity;
    uint public dividendRate;
    uint public corpAct;
    
    function execute(address sender, uint amount, uint extraData){
        if (msg.sender != parentSecurity) return;
        sender.send(amount*dividendRate);
        security(msg.sender).admin(corpAct,sender,-int(amount),corpAct);
        security(msg.sender).admin(corpAct,sender,int(amount),corpAct+1);
    }
    
}