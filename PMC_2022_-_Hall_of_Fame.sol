// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract PMC_2022_Hall_of_Fame {
 
    mapping(uint256 => string) teams;       // Teams, uint256 is their final position, eg. 1 = first, top winner
    mapping(uint256 => string) players;     // Players, uint256 is the positing they finished in, eg. players from the position 1st team.
    string judge_favorites;
    string community_choice;

    bool is_event_finished;
    address recorder;

    event EventHasEnded(string message);
    event AnnounceWinner(string firstMessage, string teams, string lastMessage);
    event RecordUpdate(string updateMessage);
 
    modifier event_live {
        require(is_event_finished == false);
        _;
    }
 
    modifier only_recorder {
        require(msg.sender == recorder);
        _;
    }
 
    constructor() {
        is_event_finished = false;
        recorder = msg.sender;

        teams[1] = "Comment";
        players[1] = "Sergey, Frank, Kamee, Alex";
        teams[2] = "Invalid Identifiers";
        players[2] = "Wigly, Laci, Lez, Wolfy";
        teams[3] = "BMEta";
        players[3] = "Peter Bertalan, Nagymarosi Mate, Toldi Balazs, Debreczeni Mate";
        teams[4] = "Metafakaz";
        players[4] = "Blaze, Petr, Gabo";
        teams[5] = "Anons";
        players[5] = "the_rig, Daniel Fox";

        judge_favorites = "Metafakaz, Comment, Anons";
        community_choice = "Metafakaz, Invalid Identifiers, Comment";

        is_event_finished = true;  // We are closing it at deploy time as everything has already finished for PMC 2022!
    }
 
    //function record_state(uint256 _rank, string memory _team_name) external event_live only_recorder returns (bool) {
    //    teams[_rank] = _team_name;
    //    emit RecordUpdate("Record has been updated.");
    //    return true;
    //}
 
    //function finish_event() external event_live only_recorder returns (bool) {
    //    is_event_finished = true;
    //    emit EventHasEnded("Polkadot Metaverse Championship is officially over! Thank you for being a part of it.");
    //    emit AnnounceWinner("The winner is", teams[1], "Congratulation!");
    //    return is_event_finished;
    //}
 
    function return_winner() external view returns (string memory) {
        return teams[1];
    }
 
    function return_by_rank(uint256 _rank) external view returns (string memory) {
        return teams[_rank];
    }

    function return_players(uint256 _team_num) external view returns (string memory){
        return (players[_team_num]);
    }

    function return_top_5() external view returns (string memory, string memory, string memory, string memory, string memory){
        return (teams[1], teams[2], teams[3], teams[4], teams[5]);
    }

    function return_judge_favorites() external view returns (string memory){
        return (judge_favorites);
    }

    function return_community_choice() external view returns (string memory){
        return (community_choice);
    }
}
