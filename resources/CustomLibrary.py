from TestObject import TestObject
from robot.api.logger import info, debug, trace, console

class CustomLibrary:
    
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self) -> None:
        self._session = None
        self.login = ''
        self.password = ''
        self._connection: TestObject = None

    def connect(self, ip):
        self._connection = TestObject(ip)

    def disconnect(self):
        self._connection = None

    @property
    def connection(self):
        if not self._connection:
            raise SystemError('No Connection established! Connect to server first!')
        return self._connection

    @property
    def session(self):
        if self._session is None:
            raise PermissionError('No valid user session. Authenticate first!')
        return self._session

    def set_login_name(self, login):
        '''Sets the users login name and stores it for authentication.'''
        self.login = login
        info(f'User login set to: {login}')

    def set_password(self, password):
        '''Sets the users login name and stores it for authentication.'''
        self.password = password
        info(f'Password set.')

    def execute_login(self):
        '''Triggers the authentication process at the backend and stores the session token.'''
        self._session = self.connection.authenticate(self.login, self.password)
        if self.session:
            info(f'User session successfully set.')
            debug(f'Session token is: {self.session}')
        self.login = self.password = ''

    def login_user(self, login, password) -> None:
        '''`Login User` authenticates a user to the backend.

        The session will be stored during this test suite.'''
        self._session = self.connection.authenticate(login, password)

    def logout_user(self):
        '''Logs out the current user.'''
        self.connection.logout(self.session)

    def create_new_user(self, name, login, password, right):
        '''Creates a new user with the give data.'''
        user_id = self.connection.post_new_user(self.session, name, login)
        self.connection.put_user_password(self.session, password, user_id=user_id)
        self.connection.put_user_right(self.session, right, user_id)

    def change_own_password(self, new_password, old_password):
        '''Changes the own password given the new and current one.'''
        self.connection.put_user_password(self.session, new_password, old_password)

    def change_users_password(self, login, new_password):
        '''Changes the password of a user by its name.
        Requires Admin priviliges!'''
        user_id = self.get_user_id(login)
        self.connection.put_user_password(self.session, new_password, user_id=user_id)

    def get_all_users(self):
        '''`Get All Users` does return a list of user-dictionaries.

        A user dictionary has the keys `name`, `login`, `right` and `active`.
        This keyword need Admin privileges.

        Example:
        `{'name': 'Peter Parker', 'login': 'spider', 'right': 'user', 'active': True}`
        '''
        return self.connection.get_user_all(self.session)

    def get_user_details(self, user_id=None):
        '''Returs the user details of the given user_id or if None the own user data.'''
        return self.connection.get_user(self.session, user_id)

    def get_user_id(self, login):
        '''Returns the user_id based on login.'''
        return self.connection.get_user_id(self.session, login)

    def get_username(self, user_id=None):
        '''Returns the users full name of the given user_id or if None the own user data.'''
        return self.connection.get_user_name(self.session, user_id)

    def get_server_version(self):
        return self.connection.get_version(self.session)