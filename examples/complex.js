/**
 * This is a complex file structure, that provides a test case for not
 * overwriting `javascript.jsx` as a filetype.
 *
 * Taken from:
 * https://github.com/chili-epfl/FROG/blob/14ed63ab5a267fa5b7d677965ad03af80c969a4e/frog/imports/ui/svg/index.js
 *
 * @flow
 */
import React, { Component } from 'react';
import { Provider } from 'mobx-react';
import Form from 'react-jsonschema-form';
import styled from 'styled-components';

import { connect, store } from './store';
import Graph from './Graph';
import Rename from './Rename';
import SidePanel from './SidePanel';
import GraphConfigPanel from './GraphConfigPanel';
import GraphList from './GraphList';
import { assignGraph } from '../../api/graphs';

import './App.css';

const GraphConfigPanelContainer = styled.div`
  position: relative;
  background-color: #ccccff;
  padding: 10px;
  margin-bottom: 10px;
`;

const Row = styled.div`
  position: relative;
  padding: 0px;
  height: 760px;
  margin: 0px;
  display: flex;
`;

/* padding: 0; */
const GraphContainer = styled.div`
  position: relative;
  width: 1150px;
  height: 760px;
`;

const SidebarContainer = styled.div`
  padding: 0px;
  width: 300px;
  background-color: #ccffff;
  margin-left: 10px;
`;

const GraphListContainer = styled.div`
  padding: 0px;
  width: 300px;
  background-color: #ccffcc;
  margin-right: 10px;
`;

const SettingsContainer = styled.div`
  position: relative;
  background-color: #ffcccc;
  padding: 10px;
  margin-top: 10px;
`;

const App = connect(({ store: { panOffset, hasSelection } }) => (
  <div>
    <GraphConfigPanelContainer>
      <GraphConfigPanel />
    </GraphConfigPanelContainer>
    <Row>
      <GraphListContainer>
        <GraphList />
      </GraphListContainer>
      <GraphContainer>
        <Graph
          width={1000}
          height={600}
          viewBox={`${panOffset} 0 1000 600`}
          preserveAspectRatio="xMinYMin slice"
          scaleFactor={1}
        />
        <Rename />
        <Graph
          width={1000}
          height={150}
          viewBox={'0 0 4000 600'}
          preserveAspectRatio="xMinYMin slice"
          hasPanMap
          scaleFactor={4}
        />
      </GraphContainer>
      <SidebarContainer>
        {!!hasSelection && <SidePanel />}
      </SidebarContainer>
    </Row>
    <SettingsContainer>
      <Settings />
    </SettingsContainer>
  </div>
));

export default class AppClass extends Component {
  componentWillMount() {
    store.setId(assignGraph());
  }

  render() {
    return (
      <Provider store={store}>
        <div>
          <App />
        </div>
      </Provider>
    );
  }
}

const settingsSchema: Object = {
  type: 'object',
  properties: { overlapAllowed: { type: 'boolean', title: 'Overlap allowed' } }
};

const Settings: Function = connect(({ store: { updateSettings, undo, canUndo } }) => (
  <Form
    schema={settingsSchema}
    onChange={({ formData }) => updateSettings(formData)}
  >
    <button type="button" disabled={!canUndo} onClick={undo}>Undo</button>
  </Form>
));

const keyDown = e => {
  if (store.renameOpen) {
    return;
  }
  if (e.keyCode === 27) {
    // esc
    store.cancelAll();
    store.unselect();
  }
  if (e.keyCode === 8) {
    // backspace
    store.deleteSelected();
  }
  if (e.keyCode === 83) {
    // s - social operator
    store.placeOperator('social');
  }
  if (e.keyCode === 80) {
    // p - product operator
    store.placeOperator('product');
  }
};

window.addEventListener('keydown', keyDown);
