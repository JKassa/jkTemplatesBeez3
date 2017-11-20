<div class="row-fluid jk-relateds">
  <ul class="thumbnails center">
    {% for related in relateds %}
    <li class="span3">
      <div class="over-wraper">
        <div class="thumbnail over-wraper-long">
          <!--Product Image-->
          <div class="product-image">
            <img {{ related.image | img_exists: '50x70' }} style="max-height: 70px;" alt="{{ related.alias }}" />
          </div>
          <div class="caption">
            <!--Name and URL of the product-->
            <h5>
              <a href="{{ related.url }}">
                {{ related.name }}
              </a>
            </h5>
            <!--SKU (code)-->
            <p>
              <small>{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ related.sku }}</small>
            </p>
            <!--Price the product-->
            <p class="cost">
              {% if related.old_cost %}
              <!--old cost-->
              <del>{{ related.old_cost }}{{ currency.symbol }}</del>
              {% endif %}
              <!--cost-->
              <span>{{ related.cost }}</span>{{ currency.symbol }}
            </p>
            <!--Add to cart-->
            <p>
              <a href="#" class="button" data-click="to-cart" data-id="{{ related.id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', related.name }}">
                {{ '_' | jtext: 'COM_JKASSA_ADD' }}
              </a>
            </p>
          </div>
        </div>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>