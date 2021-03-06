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
//Stock splits increase the number of shares in existence (ie for evry 1 share you own you get three new shares)
contract stockSplit is corpAct{
    function stockSplit(address parent, uint rate, uint ca){
        parentSecurity = parent;
        ratio = rate;
        corpAct = ca;
    }
    address public parentSecurity;
    uint public ratio;
    uint public corpAct;
    //calls the security contracts and removes the old shares and adds the new shares
    function execute(address sender, uint amount, uint extraData){
        if (msg.sender != parentSecurity) return;
        security(msg.sender).admin(corpAct,sender,-int(amount),corpAct);
        security(msg.sender).admin(corpAct,sender,int(3*amount),corpAct+1);
    }
    
}