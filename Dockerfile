FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY *.sln ./
COPY */*.csproj ./

RUN for file in $(ls *.csproj); do mkdir -p ${file%.*}/ && mv $file ${file%.*}/; done
RUN dotnet restore

COPY . .
RUN dotnet build
RUN dotnet publish Todos/Todos.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
COPY --from=build /app/out .

EXPOSE 8080
ENTRYPOINT [ "dotnet", "Todos.dll" ]
