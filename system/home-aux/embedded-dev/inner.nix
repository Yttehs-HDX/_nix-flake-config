{ usernames, ... }:

{
  users.groups.uucp.members = usernames;
  users.groups.dialout.members = usernames;
}
