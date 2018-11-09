/*
 * This file is blatantly copied from
 * https://github.com/patrick91/Styled-Components-Typescript-Example
 */
import * as React from 'react';
import styled from 'styled-components';


interface SectionProps {
  children?: React.ReactChild;
  className?: string;
}


class Section extends React.Component<SectionProps, {}> {
  render() {
    return <div className={this.props.className}>
      {this.props.children}
    </div>;
  }
}


const StyledSection = styled(Section)`
  width: 100vw;
  height: 100vh;
  background: #2A2C39;

  display: flex;
  justify-items: center;
  align-items: center;
`;

interface ExistingInterface {
  someAttribute: boolean;
}

const InterfaceComponent = styled<ExistingInterface, 'h1'>('h1')`
  background-color: blue;
  color: green;
`;

const InlineInterfaceComponent = styled<{
  someAttribute: any
}, 'h1'>('h1')`
  background-color: white;
  color: black;
`;

const InlineInterfaceComponent2 = styled<{
  someAttribute: {
    someNestedAttribute: any;
  };
  anotherAttribute: any;
}, 'h1'>('h1')`
  background-color: black;
  color: white;
`;

const ExtendedInterfaceComponent = styled<ExistingInterface & {
  someAttribute: {
    someNestedAttribute: any;
  };
  anotherAttribute: any;
}, 'h1'>('h1')`
  background-color: hotpink;
  color: papayawhip;
`;

const AlternativeInterfaceComponent = styled<ExistingInterface | {
}, 'h1'>('h1')`
  background: papayawhip;
  color: hotpink;
`;

export default StyledSection;
