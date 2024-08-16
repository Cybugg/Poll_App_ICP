import Text "mo:base/Text";
import RBTree "mo:base/RBTree";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";



actor {
  var question: Text = "Who is your favourite artiste?";
  public query func getQuestion():async Text{
    question;
  };
  var votes:RBTree.RBTree<Text, Nat> = RBTree.RBTree(Text.compare);
  public query func getVotes():async [(Text,Nat)]{
    Iter.toArray(votes.entries());
  };
  public func vote(entry:Text):async [(Text,Nat)]{
    let votes_for_entry:?Nat = votes.get(entry);

    let current_votes_for_entry: Nat = switch votes_for_entry{
      case null 0;
      case (?Nat) Nat;
    };

    votes.put(entry, current_votes_for_entry + 1);
    Iter.toArray(votes.entries());
  };
  public func resetVotes():async [(Text,Nat)]{
    votes.put("Davido",0);
    votes.put("Wizkid",0);
    votes.put("Rema",0);
    votes.put("Burnaboy",0);
    Iter.toArray(votes.entries());
  }
};
