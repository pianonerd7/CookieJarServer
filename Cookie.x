/* Program definition for RPC message board
****************************************************/


/* Struct to determine Tina (0) or Judy (1) */ 
Struct userID {
	int id;
}

/* Struct to return status */
struct returnStatus {
	int cookieStatus;
}

program MESSAGE_BOARD
{
  version MESSAGE_BOARD_VERSION
  {
    struct returnStatus START(param1) = 1;
    struct returnStatus QUIT(param1) = 2;
    struct returnOne RETRIEVE_MESSAGE (param2) = 3;
    struct returnStatus INSERT_MESSAGE (param3) = 4;
    struct returnAll LIST_ALL_MESSAGES (param1) = 5;
    struct returnStatus DELETE_MESSAGE (param2) = 6;
  } = 1;
} = 0x2defaced;
