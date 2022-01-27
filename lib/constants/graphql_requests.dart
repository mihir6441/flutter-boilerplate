class GraphQlRequests {
  static String getClipsList = r'''
query clips($perPage: Int,$page: Int){
  clips(perPage: $perPage,page: $page)
   {
    data{
      id
      description
    	clip
      screenshot
    }
    pagination{
      perPage
      currentPage
      hasMorePages
    }
    }
  }
  ''';
}
