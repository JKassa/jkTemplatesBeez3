<!--List categories-->
<div class="categories-list">
  <ul>
    {% for category in categories %}
    <li style="margin-bottom: 20px;">
      <!--Title category and URL category-->
      <h3 class="item-title">
        <a href="{{ category.url }}">
          {{ category.title }}
        </a>
      </h3>
      
      <!--Image category-->
      <!--Description category-->
      <div>
        <p>
          <img {{ category.image | img_exists: '321x213' }} style="max-width: 100%" alt="{{ category.image_alt }}" />
        </p>
        <p>
          {{ category.desc | truncateDesc: 120 }}
        </p>
      </div>
      
      <div>
        {% if category.children %}
        <!--Subcategories-->
        <div>
          <strong>
            {{ '_' | jtext: 'JGLOBAL_SUBCATEGORIES' }}
          </strong>
          <ul>
            {{ category.children }}
          </ul>
        </div>
        {% else %}
        <!--Products Quantity-->
        <p>
          <strong>{{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', category.num }}</strong>
        </p>
        {% endif %}
      </div>
    </li>
    {% endfor %}
  </ul>
</div>