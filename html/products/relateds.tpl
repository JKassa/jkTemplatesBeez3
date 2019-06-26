<div class="block-products jk-relateds">
  <ul class="items-row cols-3 categories-module">
	{% assign rowcount = 0 %}
    {% for related in relateds %}
	{% assign rowcount = rowcount | plus: 1 %}
    <li class="item column-{{ rowcount }}">
      <div class="article-info">
        <div class="product-image text-center">
          <img {{ related.image | img_exists: '104x150' }} alt="{{ related.alias }}" />
        </div>
        <div class="caption">
          <!--Name and URL of the product-->
          <h4>
            <a href="{{ related.url }}">
              {{ related.name }}
            </a>
          </h4>
		  <!--SKU (code)-->
          <p class="text-right">
            <small>{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ related.sku }}</small>
          </p>
          <!--Price the product-->
          <p>
            {% if related.old_cost %}
            <!--old cost-->
            <del>{{ related.old_cost }}{{ currency.symbol }}</del>
            {% endif %}
            <!--cost-->
			<span class="cost">
              <span>{{ related.cost }}</span>{{ currency.symbol }}
			</span>
          </p>
          <!--Add to cart-->
          <p class="text-center">
            <a href="#" class="button" data-click="to-cart" data-id="{{ related.id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', related.name }}">
              {{ '_' | jtext: 'COM_JKASSA_ADD' }}
            </a>
          </p>
        </div>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>