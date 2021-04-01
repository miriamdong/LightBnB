const bcrypt = require('bcrypt');

module.exports = function(router, database) {

  // Create a new user
  router.post('/', (req, res) => {
    const user = req.body;
    user.password = bcrypt.hashSync(user.password, 12);
    database.addUser(user)
      .then(user => {
        if (!user) {
          res.send({
            error: "error"
          });
          return;
        }
        req.session.userId = user.id;
        res.send("🤗");
      })
      .catch(e => res.send(e));
  });

  /**
   * Check if a user exists with a given username and password
   * @param {String} email
   * @param {String} password encrypted
   */
  const login = function(email, password) {
    console.log('test');
    return database.getUserWithEmail(email)
      .then(user => {
        console.log(bcrypt.compareSync('password', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'));

        if (bcrypt.compareSync(password, user.password)) {

          return user;
        }
        return null;
      });
  };
  exports.login = login;

  router.post('/login', (req, res) => {
    const {
      email,
      password
    } = req.body;
    console.log(email, password);
    login(email, password)
      .then(user => {
        if (!user) {
          res.send({
            error: "error test"
          });
          return;
        }
        req.session.userId = user.id;
        res.send({
          user: {
            name: user.name,
            email: user.email,
            id: user.id
          }
        });
      })
      .catch(e => res.send(e));
  });

  router.post('/logout', (req, res) => {
    req.session.userId = null;
    res.send({});
  });

  router.get("/me", (req, res) => {
    const userId = req.session.userId;
    if (!userId) return res.send({
      message: "not logged in"
    });
    database.getUserWithId(userId)
      .then(user => {
        if (!user) return res.send({
          error: "no user with that id"
        });
        res.send({
          user: {
            name: user.name,
            email: user.email,
            id: userId
          }
        });
      })
      .catch(e => res.send(e));
  });

  return router;
};