import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS, LOGOUT_CURRENT_USER } from "../actions/session_actions";

const _nullSession = {
  currentUser: null
};

export const sessionReducer = (state = _nullSession, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return action.currentUser;
    case LOGOUT_CURRENT_USER:
      return _nullSession;
    default:
      return state;
  }
};