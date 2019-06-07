class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductModel productModel;
  ProductBloc({@required this.productModel}) :assert(productModel != null);
 @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
  try{
      if(event is AddProductToWishList)
        yield* _addProductToWishListMTS();
      else if(event is AddProductToCart)
        yield* _addProductToCartMTS(event.cartItem);
      else if(event is ChangeProductState)
        yield* _changeProductStateMTS();
 }catch(e){
     yield ErrorState(e):
} }
Stream _addProductToWishListMTS()async*{
    //Api 
     await AiRepository().addToWishList(productModel);
  }
}

//Snippet of ApiRepository like class

class ApiRepository{

  Future<void> addToWishList(ProductModel productModel)async{
      //Does some HTTPCall that may throw error if something happens
      throw Error();
  }

}

