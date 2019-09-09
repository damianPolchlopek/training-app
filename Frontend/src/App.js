import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';

import Layout from './hoc/Layout/Layout';
import Home from './containers/Home/Home';
import Diet from './containers/Diet/Diet';
import Training from './containers/Training/Training';
import Settings from './containers/Settings/Settings';


class App extends Component {
  render () {
    return (
      <div>
          <Layout>
            <Switch>
              <Route path="/diet" component={Diet} />
              <Route path="/training" component={Training} />
              <Route path="/settings" component={Settings} />
              <Route path="/" exact component={Home} />
            </Switch>
          </Layout>
      </div>
    );
  }
}

export default App;
