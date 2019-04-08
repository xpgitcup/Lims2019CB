<div class="nav">
    <ul>
        <g:each in="${systemMenuList}" var="item" status="i">
            <li>
                ${item.menuContext}
            </li>
        </g:each>
    </ul>
</div>