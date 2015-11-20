/* Program definition for RPC message board
****************************************************/


/* Struct to determine Tina (0) or Judy (1) */ 
struct param {
	int userId;
};

/* Struct to return status */
struct returnStatus {
	int cookieStatus;
};

program MESSAGE_BOARD
{
  version MESSAGE_BOARD_VERSION
  {
    struct returnStatus GETMEMYCOOKIE(param) = 1;
  } = 1;
} = 0x2defaced;
