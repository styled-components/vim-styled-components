// @flow
import styled from 'styled-components';


class CoffeeList extends React.Component<Props, State> {
  render() {
    return (
      <View style={{ flex: 1 }}>
        {coffees === null ? (
          <Text>Loading...</Text>
        ) : (
          <FlatList
            css={`
              background: none;

              &:hover {
                background: none;
              }
            `}
            refreshControl={
              <RefreshControl refreshing={fetching} onRefresh={refetch} />
            }
            renderItem={({ item: coffee }) => (
              <CoffeeListItem onPress={this.selectCoffee} coffee={coffee} />
            )}
            style={{ flex: 1 }}
          />
        )}
        <Modal
          visible={!selectedCoffee}
          animationType="slide"
          onRequestClose={this.closeDetailModal}
        >
          <CloseButton onPress={this.closeDetailModal} />
          {selectedCoffee && (
            <CuppingResults {...selectedCoffee} />
          )}
        </Modal>
      </View>
    );
  }
}

export default withAuth(CoffeeList);
