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
//Credits users with a certain number of new shares in a new company.
contract spinOff is corpAct{
    function spinOff(address parent, address newShares, uint rate, uint ca){
        parentSecurity = parent;
        ratio = rate;
        corpAct = ca;
        spinoff = security(newShares);
    }
    address public parentSecurity;
    uint public ratio;
    uint public corpAct;
    security spinoff;
    //calls the security contracts and removes the old shares and adds the new shares
    function execute(address sender, uint amount, uint extraData){
        if (msg.sender != parentSecurity) return;
        spinoff.admin(0,sender,int(amount*ratio),1);
        security(msg.sender).admin(corpAct,sender,-int(amount),corpAct);
        security(msg.sender).admin(corpAct,sender,int(amount),corpAct+1);
    }
    
}