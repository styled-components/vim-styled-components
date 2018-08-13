const Container = styled.div`
  display: grid;
  border: 1px solid black;

  &:hover {
    color: blue;
  }

  @media (max-width: 700px) {
    grid-template-column: 1fr 0px;
  }

  media (max-width: 700px) {
    grid-template-column: 1fr 0px;
  }
`;
