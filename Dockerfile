FROM mcr.microsoft.com/dotnet/core/sdk:3.1
WORKDIR /reporoot
COPY . .

RUN dotnet publish build.proj -o /buildoutput

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
EXPOSE 80
COPY --from=0 /buildoutput .
