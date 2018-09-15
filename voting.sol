pragma solidity ^0.4.18;

contract voting {

  struct voting_info {
    uint256 vote_number;
    bool vote_YesNo;
    address post_owner;
  }

  uint256 public total_Number;
  uint256 public post_id;  // 이걸 어디서 받아오지?
  address public post_writer;// 이걸 어디서 받아오지?
  voting_info public Vote_Number;    /// 이 안에 vote_owner 주소는 어디서 받음?
  address public msgasdf;
  mapping(address => mapping(uint256 => voting_info)) vote_upCheck;

  constructor () public {
    require(!vote_upCheck[msgasdf][post_id].vote_YesNo);
    Vote_Number.vote_number = vote_upCheck[msgasdf][post_id].vote_number;
    Vote_Number.vote_YesNo = false;
    post_writer = 0xe3c5b8db1d9c32252a108764d1ea9c2f407710c6; // 외부에서 address를 받아야함
    // post_id
  }

  function vote_Add () public  {
    require(!vote_upCheck[msgasdf][post_id].vote_YesNo);
    msgasdf = msg.sender;
    vote_upCheck[msgasdf][post_id].vote_number+=1;
    Vote_Number.vote_number = vote_upCheck[msgasdf][post_id].vote_number;
    vote_upCheck[msgasdf][post_id].vote_YesNo=true;
    Vote_Number.vote_YesNo=vote_upCheck[msgasdf][post_id].vote_YesNo; // YES/NO modification
    total_Number+=1;
  }

  function getTotalValue(uint256 post_id) public view returns (uint) {
    return total_Number;
  }

  function getPostOwner(uint256 post_id) public view returns (address) {
    return post_writer;
  }
}
