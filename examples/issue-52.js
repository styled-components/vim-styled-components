const LayoutHeaderContainer = styled.div`
  width: 930px;
  margin: auto;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  min-height: 160px;

  h2, p {
    margin-left: 0;
  }

  .${Classes.ICON} {
    opacity: .7;
  }

  .txt-area:nth-child(2) {
    margin-left: 32px;
  }

  .txt-area__top-row {
    display: flex;
  }
`;

const TagContainer = styled.div`
  display: flex;
  align-items: baseline;

  .${Classes.TAG} {
    margin-left: 10px;
  }
`;
