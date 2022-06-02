FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
ARG APP-NET-SDK=$(app-net-sdk)
ARG APP-CORE-VERSION=$(app-core-version)
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
ARG APP-NET-SDK=$(app-net-sdk)
ARG APP-CORE-VERSION=$(app-core-version)
RUN echo $APP-NET-SDK
RUN echo $APP-CORE-VERSION
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "docker-app.dll"]