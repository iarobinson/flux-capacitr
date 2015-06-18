Allonsy.Mixins.PaginatableCollection = {
  parsePage: function (response) {
    this.page = response.page;
    this.total_pages = response.total_pages;
  }
}
