import React from 'react';
import styled from 'styled-components';

interface Foo {
  bool: boolean;
}

const A = styled('h1')<Foo>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const B = styled('h1')<{ [attr: string]: any, bool: boolean, tmp?: number }>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const C = styled<Foo>('h1')`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const D = styled.h1<Foo>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const E = styled.h1<{ [attr: string]: any, bool: boolean, tmp?: number }>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const F = styled.span<Foo>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const G = styled.span.attrs({ role: 'presentation' })<{ bool: boolean, tmp?: number } & Foo>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;

const H = styled(F).attrs({ role: 'presentation' })<{ bool: boolean, tmp?: number } | Foo>`
  background-color: ${props => props.bool ? props.theme.primary : props.theme.seconday};
  color: ${props => props.bool ? props.theme.seconday : props.theme.tertiary};
  display: flex;
  flex-direction: row;
  flex: 1 0 auto;
  padding: 0;
`;
