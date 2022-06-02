FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
ARG NET-SDK
ARG CORE-VERSION

ENV APP-NET-SDK=$NET-SDK
ENV APP-CORE-VERSION=$CORE-VERSION

RUN echo $APP-NET-SDK
RUN echo $APP-CORE-VERSION
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
ARG NET-SDK
ARG CORE-VERSION

ENV APP-NET-SDK=$NET-SDK
ENV APP-CORE-VERSION=$CORE-VERSION

RUN echo $APP-NET-SDK
RUN echo $APP-CORE-VERSION
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "docker-app.dll"]