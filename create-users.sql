-- allows weak passwords
SET GLOBAL validate_password_policy=LOW;

-- create main user with full access.
CREATE USER 'mikedev'@'localhost'
  IDENTIFIED BY 'password';
GRANT ALL
  ON *.*
  TO 'mikedev'@'localhost'
  WITH GRANT OPTION;
