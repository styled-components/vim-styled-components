/*
 * This file is blatantly copied from
 * https://github.com/patrick91/Styled-Components-Typescript-Example
 */
import * as React from 'react';
import styled from 'styled-components';


interface SectionProps {
  children?: React.ReactChild,
  className?: string,
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


export default StyledSection;
