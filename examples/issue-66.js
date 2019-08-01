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
  Grid: styled.div`
    display: grid;
    grid-template-columns: minmax(0, 1fr);
    grid-gap: 20px;

    @media screen and (min-width: 1500px) {
      grid-template-columns: 60% minmax(0, 1fr);
    }
  `,
};
