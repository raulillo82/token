import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor Token {
    var owner : Principal = Principal.fromText("fvc3b-dn5ks-2kftz-3xwzg-pdiof-mk7zf-qb2vr-mxnp5-nnq5v-u4fob-nqe");
    var totalSupply : Nat = 1000000000;
    var symbol : Text = "DANG";

    //ledger
    var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

    balances.put(owner, totalSupply);

    public query func balanceOf(who: Principal) : async Nat {

        let balance : Nat = switch (balances.get(who)) {
        case null 0;
        case (?result) result;
        };

        return balance;
    };

    public query func getSymbol() : async Text {
        return symbol;
    };
};