import * as express from 'express';

class App {
  public express;

  constructor() {
    this.express = express();
    this.mountRoutes();
  }

  private mountRoutes(): void {
    const router = express.Router();
    router.get('/', (req, res) => {
      res.json({
        messasge: 'hello world'
      });
    });
    this.express('/', router);
  }
}

export default new App().express;
