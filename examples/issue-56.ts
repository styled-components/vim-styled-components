const dynamicStyle = (props: any) => css`
  color: ${props.color};
  padding: 10px;
`;

css`
  padding: 10px;
`;

const exampleCSS = css`
  display: flex;
  background-color: ${color('primary')};
  align-items: center;
  padding: ${spacing('tiny')} 0;
`;
