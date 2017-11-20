<div class="pagination">
  <div class="pull-right counter">
    {{ pagesCounter }}
  </div>
  <ul>
    <li class="pagination-start">{{ start.data }}</li>
    <li class="pagination-prev">{{ previous.data }}</li>
    {% for page in pages %}
    <li>{{ page.data }}</li>
    {% endfor %}
    <li class="pagination-next">{{ next.data }}</li>
    <li class="pagination-end">{{ end.data }}</li>
  </ul>
</div>