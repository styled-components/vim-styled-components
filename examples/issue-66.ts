const Grid = styled('div')<{ gap?: number }>`
  display: grid;
  grid-template-columns: minmax(0, 1fr);
  grid-gap: ${props => props.gap || 20}px;

  @media screen and (min-width: 1500px) {
    grid-template-columns: 60% minmax(0, 1fr);
  }
`;

export default {
  User: styled.div`
    margin-bottom: 30px;
  `,
  UserErrorWrapper: styled.div`
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    min-height: 100vh;
  `,
  UserError: styled.div`
    color: ${theme.colors.hmGrey3};
    text-align: center;
  `,
  Grid: styled.div<{ gap?: number }>`
    display: grid;
    grid-template-columns: minmax(0, 1fr);
    grid-gap: ${props => props.gap || 20}px;

    @media screen and (min-width: 1500px) {
      grid-template-columns: 60% minmax(0, 1fr);
    }
  `,
  WithComponentTest: styled(Grid).withComponent('div')`
    display: none;
  `,
  WithoutTypesTest: styled('div')`
    display: none;
  `,
  PlainTest: styled.div`
    display: none;
  `,
  CssTest: css`
    display: none;
  `,
  NamedInterfaceTest: styled('div')<Interface>`
    display: none;
  `,
  TypeThenElementTest: styled<{ gap?: number }>('div')`
    display: none;
  `,
  AttrsTest: styled(Grid).attrs({ className: 'hidden' })`
    display: none;
  `,
  ExtendTest: Grid.extend<{ border: string }>`
    border: ${props => props.border || 'none' };
  `,
};
