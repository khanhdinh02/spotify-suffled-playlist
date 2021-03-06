<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spotity / Suffled Playlist</title>
    </head>
    <body>
        <header>
            <div>
                <img src="${sessionScope.user.images[0].url}">
                <span>${sessionScope.user.name}</span>
            </div>
            <p><a href="${sessionScope.user.url}" target="_blank">Profile</a></p>
            <p><a href="logout">Logout</a></p>
        </header>
        <section>
            <form action="getPlaylist" method="post">
                <input type="url" name="url" value="${sessionScope.url}" placeholder="Enter playlist's url" required>
                <button type="submit">Submit</button>
            </form>
            <c:set var="status" value="${requestScope.status}" />
            <c:if test="${not empty status}">
                <c:choose>
                    <c:when test="${status == 0}">
                        <!-- Confirm -->
                        <form action="createPlaylist" method="post">
                            <button type="submit">Create Playlist</button>
                        </form>
                    </c:when>
                    <c:when test="${status == 1}">
                        <!-- Create playlist success -->
                    </c:when>
                    <c:when test="${status == -1}">
                        <!-- Error -->
                        ${requestScope.message}
                    </c:when>
                </c:choose>
            </c:if>
        </section>
    </body>
</html>
